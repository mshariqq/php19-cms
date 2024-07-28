<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Page;
use App\Models\Category;
use App\Models\Tag;
use App\Models\Post;

class AdminController extends Controller
{
    //
    public function pages(){
        $pages  = Page::paginate('20');
        return view('admin.pages', compact('pages'));
    }

    public function posts(){
        $pages  = Post::paginate('20');
        return view('admin.posts', compact('pages'));
    }

    public function categories(){
        $cats  = Category::paginate('20');
        return view('admin.categories', compact('cats'));
    }

    public function tags(){
        $cats  = Tag::paginate('20');
        return view('admin.tags', compact('cats'));
    }

    public function new_page(){
        $pages  = Page::select('name', 'id')->get();
        return view('admin.pages-new', compact('pages'));
    }

    public function new_posts(){
        $cats  = Category::select('name', 'id')->get();
        $tags = Tag::all();
        return view('admin.posts-new', compact('cats', 'tags'));
    }

    public function store_page(Request $request){

        $page = new Page();
        $page->name = $request->name;
        $page->slug = $request->slug ;
        $page->meta_desc = $request->description;
        $page->meta_kw = $request->keywords;
        $page->content = $request->content;
        $page->status = $request->status;
        $page->parent = $request->parent;
        $page->user_id = auth()->user()->id;
        if($page->save()){
            return redirect()->route('admin.pages')->with('success', 'Page created');
        }else{
            return redirect()->route('admin.pages')->with('error', 'Something went wrong');

        }
    }

    public function store_posts(Request $request){

        // dd($request->all());

        $page = new Post();
        $page->name = $request->name;
        $page->slug = $request->slug ;
        $page->description = $request->description;
        $page->keywords = $request->keywords;
        $page->content = $request->content;
        $page->status = $request->status;
        $page->category_id = $request->category_id;
        $page->user_id = auth()->user()->id;

        if($page->save()){
                    // Sync tags with the post
                    $page->tags()->sync($request->tags);
                    return redirect()->route('admin.posts')->with('success', 'Post created');
        }else{
            return redirect()->route('admin.posts')->with('error', 'Something went wrong');

        }


    }

    public function store_categories(Request $request){

        $page = new Category();
        $page->name = $request->tag;
        $page->slug = $request->slug ;
       
        if($page->save()){
            return redirect()->route('admin.categories')->with('success', 'Category created');
        }else{
            return redirect()->route('admin.categories')->with('error', 'Something went wrong');

        }
    }


    public function store_tags(Request $request){

        $page = new Tag();
        $page->tag = $request->tag;
        $page->slug = $request->slug ;
       
        if($page->save()){
            return redirect()->route('admin.tags')->with('success', 'TAG created');
        }else{
            return redirect()->route('admin.tags')->with('error', 'Something went wrong');

        }
    }

    public function del_page($id){
        $page = Page::find($id);
        if($page){
            $page->delete();
            return redirect()->route('admin.pages')->with('success', 'Page Deleted');

        }else{
            abort('404', 'Page not found');
        }
    }

    public function del_posts($id){
        $page = Post::find($id);
        if($page){
            $page->delete();
            return redirect()->route('admin.posts')->with('success', 'Post Deleted');

        }else{
            abort('404', 'Page not found');
        }
    }

    public function del_tags($id){
        $page = Tag::find($id);
        if($page){
            $page->delete(); 
            return redirect()->route('admin.tags')->with('success', 'Tag Deleted');

        }else{
            abort('404', 'Tag not found');
        }
    }

    public function del_categories($id){
        $page = Category::find($id);
        if($page){
            $post = Post::where('category_id', $id)->first();
            if($post){
                return redirect()->route('admin.categories')->with('error', 'POSTS are attached, cant delete -> ' . $page->name);
            }
            $page->delete();
            return redirect()->route('admin.categories')->with('success', 'Category Deleted');

        }else{
            abort('404', 'Category not found');
        }
    }

    public function edit_page($id){
        $page = Page::find($id);

        if($page){
            $pages = Page::all();
            return view('admin.pages-edit', compact('page', 'pages'));

        }else{
            abort('404', 'Page not found');
        }
    }

    public function update_page(Request $request, $id)
    {
        // // Validate incoming request data
        // $validatedData = $request->validate([
        //     'name' => 'required|string|max:255',
        //     'slug' => 'required|string|max:255|unique:pages,slug,' . $id,
        //     'description' => 'required|string',
        //     'keywords' => 'nullable|string', // Adjust validation rules as per your needs
        //     'content' => 'required|string',
        //     'status' => 'required|in:draft,published', // Example of status validation
        //     'parent' => 'nullable|exists:pages,id', // Example of parent validation
        // ]);

        // Find the page by ID
        $page = Page::find($id);

        // If page not found, abort with 404 error
        if (!$page) {
            abort(404, 'Page not found');
        }

        // Update page attributes
        $page->name = $request->name;
        $page->slug = $request->slug;
        $page->meta_desc = $request->description; // Assuming 'description' is meta description
        $page->meta_kw = $request->keywords; // Assuming 'keywords' is meta keywords
        $page->content = $request->content;
        $page->status = $request->status;
        $page->parent = $request->parent;

        // Save updated page
        if ($page->save()) {
            return redirect()->route('admin.pages')->with('success', 'Page updated successfully!');
        } else {
            return redirect()->route('admin.pages')->with('error', 'Something went wrong while updating the page.');
        }
    }


}
