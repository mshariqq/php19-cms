@extends('layouts.app')

@section('title', $page->name)
@section('description', $page->meta_desc)
@section('keywords', $page->meta_kw)
@section('thumbnail', $page->thumbnail)
@section('content')

<div class="container-fluid">
    <div class="row">
        @include('inc/left-sidebar')

        <div class="col-md-7 bg-dark-light text-white pt-4 pb-5">

            <nav class="breadcrumb text-light text-white">
                <a class="breadcrumb-item text-grey" href="{{ route('homepage') }}"> Home</a>
                <a class="breadcrumb-item text-grey" href="{{ route('homepage') }}">Pages</a>
                <a class="breadcrumb-item text-grey text-warning" href="{{ route('pages.get', $page->slug) }}">{{$page->name}}</a>

            </nav>

            <hr>  

            <h5>{{$page->name}}</h5>
            <hr>
                {!! $page->content !!}
        </div>

        @include('inc/right-sidebar')
    </div>
</div>
@endsection