<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Page;

class PageController extends Controller
{
    //
    public function get_page($slug){
        $page = Page::where('slug', $slug)->first();
        if($page){
            return view('page', compact('page'));
        }else{
            abort('404', 'Page Not Found');
        }
    }
}
