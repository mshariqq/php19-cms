@extends('layouts.app')

@section('title', $page->name)
@section('description', $page->description)
@section('keywords', $page->keywords)
@section('thumbnail', $page->thumbnail)
@section('content')

<div class="container-fluid">
    <div class="row">
        @include('inc/left-sidebar')

        <div class="col-md-7 bg-dark-light text-white pt-4 pb-5">

            <nav class="breadcrumb text-light text-white">
                <a class="breadcrumb-item text-grey" href="{{ route('homepage') }}"> Home</a>
                <a class="breadcrumb-item text-grey" href="{{ route('homepage') }}">Posts</a>
                <a class="breadcrumb-item text-grey text-warning" href="{{ route('pages.get', $page->slug) }}">{{$page->name}}</a>

            </nav>

            <hr>  

            <h5>{{$page->name}}</h5>
            <span class="badge badge-pill bg-dark"> <i class="fa fa-eye" aria-hidden="true"></i> {{$page->views}}</span>
            <span class="badge badge-pill bg-dark"> <i class="fa fa-thumbs-up" aria-hidden="true"></i> {{$page->likes}} </span>
            <span class="badge badge-pill bg-dark"> <i class="fa fa-comments" aria-hidden="true"></i>  </span>
            <span class="badge badge-pill bg-dark"> <i class="fa fa-download" aria-hidden="true"></i> {{$page->downloads}} </span>
           
            <span class="badge badge-pill text-dark bg-warning">{{$page->category->name}}</span>
            @foreach ($page->tags as $item)
            <span class="badge badge-pill text-white bg-primary">#{{$item->tag}}</span>

            @endforeach
            <hr>
                {!! $page->content !!}
        </div>

        @include('inc/right-sidebar')
    </div>
</div>
@endsection