<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Page;

class HomeController extends Controller
{
    // Home page
    public function home(){
        $page = Page::where('slug', '/')->first();
        if(!$page){
            die('Page not found');
        }else{
            return view('homepage', compact('page'));
        }
       
    }
}
