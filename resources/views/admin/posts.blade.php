@extends('layouts.app')

@section('title', 'Admin Pages')
{{-- @section('description', 'Showing all tags on php19')
@section('keywords', 'php19 tags') --}}
{{-- @section('thumbnail', $page->thumbnail) --}}
@section('content')

<div class="container-fluid">
    <div class="row">
        @include('inc/left-sidebar')

        <div class="col-md-10 bg-dark-light text-white pt-4 pb-5">
                  
            <nav class="breadcrumb text-light text-white">
                <a class="breadcrumb-item text-grey" href="{{ route('dashboard') }}"> Admin</a>
                <a class="breadcrumb-item text-grey text-warning" href="{{ route('admin.posts') }}">Posts</a>
            </nav>

            <hr>     

                <h5>Showing 20 posts</h5>
                <a href="{{route('admin.posts.new')}}" class="btn btn-primary">New Post</a>
                <br>
                <br>

                @if (count($pages) > 0)
                
                    <table class="table">
                        <thead>
                            <tr>
                                <th>name</th>
                                <th>slug</th>
                                <th>views</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($pages as $item)
                                <tr>
                                    <td>
                                        <a href="{{ url('posts/' . $item->slug) }}">{{$item->name}}</a>
                                    </td>
                                    <td class="text-muted">{{$item->slug}}</td>
                                    <td> <i class="fa fa-eye text-muted" aria-hidden="true"></i> {{$item->views}}</td>
                                    <td>
                                        <a href="{{route('admin.posts.edit', $item->id)}}" class="btn btn-sm btn-primary">
                                        <i class="fa fa-pencil" aria-hidden="true"></i></a>
                                        <a href="{{route('admin.posts.delete', $item->id)}}" class="btn btn-sm btn-danger">
                                            <i class="fa fa-trash" aria-hidden="true"></i></a>

                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            {{$pages->links('pagination::bootstrap-4')}}

                        </tfoot>
                    </table>
                 
                @else 
                    <p class="text-warning">No posts found</p>
                @endif

             
                
                
           
        </div>

        {{-- @include('inc/right-sidebar') --}}
    </div>
</div>
@endsection