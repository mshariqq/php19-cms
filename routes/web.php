<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\HomeController;

use Illuminate\Support\Facades\Route;

// Homepage
Route::get('/', [HomeController::class, 'home'])->name('homepage');

// Pages

// Posts
Route::get('/posts', [PostController::class, 'all'])->name('posts.all');
Route::get('/posts/{slug}', [PostController::class, 'find'])->name('posts.post');
Route::get('/posts/{id}/new-like', [PostController::class, 'new_like'])->name('posts.new_like');
Route::post('/posts/{id}/new-comment', [PostController::class, 'new_comment'])->name('posts.new_comment');


// Categories
Route::get('/catgories', [CategoryController::class, 'all'])->name('categories.all');
Route::get('/catgories/{slug}', [CategoryController::class, 'posts'])->name('categories.posts');


// Tags
Route::get('/tags', [TagController::class, 'all'])->name('tags.all');
Route::get('/tags/{slug}', [TagController::class, 'posts'])->name('tags.posts');


// Dashboard
Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');


// Profile
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
