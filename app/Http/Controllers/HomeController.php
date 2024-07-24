<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Page;
use App\Models\Post;

class HomeController extends Controller
{
    // Home page
    public function home(){
        $page = Page::where('slug', '/')->first();
        if(!$page){
            abort('404', 'Page not found');
        }else{
            $posts = Post::paginate(12);

            return view('homepage', compact('page', 'posts'));
        }
       
    }
}
