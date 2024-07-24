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
            // Increment views count
            $page->views = $page->views + 1;
            $page->save(); // Save the updated views count
           
            return view('page', compact('page'));
        } else {
            abort(404, 'Page Not Found');
        }
    }
}
