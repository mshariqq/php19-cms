<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Page;

class AdminController extends Controller
{
    //
    public function pages(){
        $pages  = Page::paginate('20');
        return view('admin.pages', compact('pages'));
    }

    public function new_page(){
        $pages  = Page::select('name', 'id')->get();
        return view('admin.pages-new', compact('pages'));
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

    public function del_page($id){
        $page = Page::find($id);
        if($page){
            $page->delete();
            return redirect()->route('admin.pages')->with('success', 'Page Deleted');

        }else{
            abort('404', 'Page not found');
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
