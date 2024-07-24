<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\TagController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\PageController;

use Illuminate\Support\Facades\Route;

// Homepage
Route::get('/', [HomeController::class, 'home'])->name('homepage');

// Pages
Route::get('/pages', function(){
    return redirect()->route('homepage');
})->name('posts.all');
Route::get('/pages/{slug}', [PageController::class, 'get_page'])->name('pages.get');


// Posts
Route::get('/posts', [PostController::class, 'all'])->name('posts.all');
Route::get('/posts/{slug}', [PostController::class, 'find'])->name('posts.details');
Route::get('/posts/{id}/new-like', [PostController::class, 'new_like'])->name('posts.new_like');
Route::post('/posts/{id}/new-comment', [PostController::class, 'new_comment'])->name('posts.new_comment');


// Categories
Route::get('/categories', [CategoryController::class, 'all'])->name('categories.all');
Route::get('/categories/{slug}', [CategoryController::class, 'posts'])->name('categories.posts');


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

// Admin
Route::middleware('auth')->group(function () {
    Route::get('/admin/pages', [AdminController::class, 'pages'])->name('admin.pages');
    Route::get('/admin/pages/new', [AdminController::class, 'new_page'])->name('admin.pages.new');
    Route::post('/admin/pages/store', [AdminController::class, 'store_page'])->name('admin.pages.store');
    Route::get('/admin/pages/delete/{id}', [AdminController::class, 'del_page'])->name('admin.pages.delete');
    Route::get('/admin/pages/edit/{id}', [AdminController::class, 'edit_page'])->name('admin.pages.edit');
    Route::post('/admin/pages/update/{id}', [AdminController::class, 'update_page'])->name('admin.pages.update');

    Route::get('/admin/categories', [AdminController::class, 'categories'])->name('admin.categories');
    Route::get('/admin/categories/edit/{id}', [AdminController::class, 'edit_categories'])->name('admin.categories.edit');
    Route::get('/admin/categories/delete/{id}', [AdminController::class, 'del_categories'])->name('admin.categories.delete');
    Route::post('/admin/categories/store', [AdminController::class, 'store_categories'])->name('admin.categories.store');

    Route::get('/admin/categories', [AdminController::class, 'categories'])->name('admin.categories');
    Route::get('/admin/categories/edit/{id}', [AdminController::class, 'edit_categories'])->name('admin.categories.edit');
    Route::get('/admin/categories/delete/{id}', [AdminController::class, 'del_categories'])->name('admin.categories.delete');
    Route::post('/admin/categories/store', [AdminController::class, 'store_categories'])->name('admin.categories.store');

    Route::get('/admin/tags', [AdminController::class, 'tags'])->name('admin.tags');
    Route::get('/admin/tags/edit/{id}', [AdminController::class, 'edit_tags'])->name('admin.tags.edit');
    Route::get('/admin/tags/delete/{id}', [AdminController::class, 'del_tags'])->name('admin.tags.delete');
    Route::post('/admin/tags/store', [AdminController::class, 'store_tags'])->name('admin.tags.store');

    // Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
