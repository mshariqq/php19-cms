@extends('layouts.app')

@section('title', $page->name)
@section('content')

<div class="container-fluid">
    <div class="row">
        @include('inc/left-sidebar')



        <div class="col-md-7 bg-dark text-white pt-4 pb-5">
           
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
                
           
        </div>



        @include('inc/right-sidebar')
    </div>
</div>
@endsection