<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'slug', 'user_id', 'content', 'status', 'keywords', 'description', 'thumbnail', 'parent', 'download_link', 'downloads', 'views', 'likes', 'category_id'
    ];

      /**
     * Get the user that owns the page.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function tag()
    {
        return $this->belongsTo(Tag::class);
    }
}
