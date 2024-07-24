<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Tag;
use App\Models\Post;


class TagController extends Controller
{
    //
    public function all(){
        $tags = Tag::all();
        return view('archives.tags-all', compact('tags'));

    }

    public function posts(Request $request)
    {
        $tag = Tag::where('slug', $request->slug)->first();
        // If tag not found, return 404 error
        if (!$tag) {
            abort(404, 'Tag not found');
        }

        // Get total posts count for the tag
        $totalPosts = $tag->posts()->count();

        // Paginate posts with a limit of 12 per page
        $posts = $tag->posts()->paginate(12);

        return view('archives.tags', compact('posts', 'tag', 'totalPosts'));
    }
}
