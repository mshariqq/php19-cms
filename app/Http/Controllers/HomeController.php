<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    // Home page
    public function home(){
        return view('homepage');
    }
}
