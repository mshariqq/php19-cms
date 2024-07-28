@extends('layouts.app')

@section('title', $tag->name)
@section('description', 'Posts archive for tag ' . $tag->name)
@section('keywords', 'php19 tags, ' . $tag->name)
{{-- @section('thumbnail', $page->thumbnail) --}}
@section('content')

<div class="container-fluid">
    <div class="row">
        @include('inc/left-sidebar')

        <div class="col-md-10 bg-dark-light text-white pt-4 pb-5">

            <nav class="breadcrumb text-light text-white">
                <a class="breadcrumb-item text-grey" href="{{ route('homepage') }}"> Home</a>
                <a class="breadcrumb-item text-grey" href="{{ route('tags.all') }}">Tags</a>
                <a class="breadcrumb-item text-whhite" href="{{ route('tags.posts', $tag->slug) }}">{{$tag->tag}}</a>

            </nav>

            <hr>     

                <h5>Showing posts for <b class="text-primary">#{{$tag->tag}}</b></h5>
      
                <small class="text-warning">{{ $totalPosts }} Posts found</small>
                <br>
                <br>
                
                @include('inc.post-card', ['decrease_thumbnail' => 'decrease-thumbnail'])

                <div class="d-flex justify-content-center mt-4">
                    {{$posts->links('pagination::bootstrap-4')}}
                </div>
                
        </div>

    </div>
</div>
@endsection