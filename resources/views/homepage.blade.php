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
           
                <div class="card bg-black text-white">
                    <div class="card-body">
                        <b>Welcome to PHP19</b> <br> <span class="text-grey">Free download Scripts, Themes, Plugins. Programming Blog, Q&A, Discussions</span>
                        <form action="" method="post" class="mt-4">
                            <div class="form-group d-flex">
                            <input type="text"
                                class="form-control" name="" id="" aria-describedby="helpId" placeholder="Search by name, keyword, category, tag">
                                <button type="submit" class="btn btn-warning"> <i class="fa fa-search" aria-hidden="true"></i></button>
                            </div>
                        </form>
                    </div>
                </div>

                <br>
                

                <h5>Latest Posts</h5>
                @include('inc/post-card')

                <div class="d-flex justify-content-center mt-4">
                    {{$posts->links('pagination::bootstrap-4')}}
                </div>
                
           
        </div>



        @include('inc/right-sidebar')
    </div>
</div>
@endsection