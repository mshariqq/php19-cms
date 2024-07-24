<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Page extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'slug', 'user_id', 'content', 'status', 'meta_kw', 'meta_desc', 'thumbnail', 'parent', 
    ];

     /**
     * Get the user that owns the page.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

  
}
