<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;

class PostController extends Controller
{
    //
    public function get_post($slug){
        $page = Post::where('slug', $slug)->first();
    
        if($page){
            // Increment views count
            $page->views = $page->views + 1;
            $page->save(); // Save the updated views count
           
            return view('post', compact('page'));
        } else {
            abort(404, 'Page Not Found');
        }
    }
}
