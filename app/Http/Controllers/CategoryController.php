<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Post;

class CategoryController extends Controller
{
    //
    public function all(){
        $cats = Category::all();
        return view('archives.categories-all', compact('cats'));

    }

    public function posts(Request $request)
    {
        $cat = Category::where('slug', $request->slug)->first();
        if (!$cat) {
            abort(404, 'Category not found');
        }
    
        // Get total posts count for the category
        $totalPosts = Post::where('category_id', $cat->id)->count();
    
        // Paginate posts with a limit of 12 per page
        $posts = Post::where('category_id', $cat->id)->paginate(12);
    
        return view('archives.categories', compact('posts', 'cat', 'totalPosts'));
    }
    
}
