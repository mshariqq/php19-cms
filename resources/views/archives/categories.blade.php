@extends('layouts.app')

@section('title', $cat->name)
@section('description', 'Posts archive for ' . $cat->name)
@section('keywords', 'php19, ' . $cat->name)
{{-- @section('thumbnail', $page->thumbnail) --}}
@section('content')

<div class="container-fluid">
    <div class="row">
        @include('inc/left-sidebar')



        <div class="col-md-10 bg-dark-light text-white pt-4 pb-5">

                  
            <nav class="breadcrumb text-light text-white">
                <a class="breadcrumb-item text-grey" href="{{ route('homepage') }}"> Home</a>
                <a class="breadcrumb-item text-grey" href="{{ route('categories.all') }}">Categories</a>
                <a class="breadcrumb-item text-whhite" href="{{ route('categories.posts', $cat->slug) }}">{{$cat->name}}</a>

            </nav>

            <hr>
           
                

                <h5>Showing posts for <b class="text-primary">{{$cat->name}}</b></h5>
      
                <small class="text-warning">{{ $totalPosts }} Posts found</small>
                <br>
                <br>
                
                @include('inc/post-card')

                <div class="d-flex justify-content-center mt-4">
                    {{$posts->links('pagination::bootstrap-4')}}
                </div>
                
           
        </div>



        {{-- @include('inc/right-sidebar') --}}
    </div>
</div>
@endsection