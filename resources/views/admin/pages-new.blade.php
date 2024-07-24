

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
                <a class="breadcrumb-item text-grey text-warning" href="{{ route('admin.pages') }}">Pages</a>
            </nav>

            <hr>     

                <h5>Add new page</h5>
                <br>
                
                <form class="row" method="POST" action="{{ route('admin.pages.store') }}">
                    @csrf

                    <div class="col-md-8">
                        <div class="form-group mb-2">
                            <label for="name">Name</label>
                            <input id="name" type="text" class="form-control @error('name') is-invalid @enderror"
                                name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>
                            @error('name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
    
                        <div class="form-group mb-2">
                            <label for="slug">Slug</label>
                            <input id="slug" type="text" class="form-control @error('slug') is-invalid @enderror"
                                name="slug" value="{{ old('slug') }}" required autocomplete="slug">
                            @error('slug')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
    
                        <div class="form-group mb-2">
                            <label for="description">Description</label>
                            <textarea id="description"
                                class="form-control @error('description') is-invalid @enderror" name="description"
                                rows="3" >{{ old('description') }}</textarea>
                            @error('description')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
    
                        <div class="form-group mb-2">
                            <label for="keywords">Keywords</label>
                            <input id="keywords" type="text"
                                class="form-control @error('keywords') is-invalid @enderror" name="keywords"
                                value="{{ old('keywords') }}" >
                            @error('keywords')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
                        <div class="form-group mb-2">
                            <label for="content">Content</label>
                            <textarea id="content" class="form-control @error('content') is-invalid @enderror"
                                name="content" rows="6" >{{ old('content') }}</textarea>
                            @error('content')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
    
                    </div>

                    <div class="col-md-4">
                        <div class="form-group mb-2">
                            <label for="status">Status</label>
                            <select id="status" class="form-control @error('status') is-invalid @enderror"
                                name="status" >
                                <option value="draft" {{ old('status') == 'draft' ? 'selected' : '' }}>Draft</option>
                                <option value="published" {{ old('status') == 'published' ? 'selected' : '' }}>Published</option>
                            </select>
                            @error('status')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>

                        <div class="form-group mb-2">
                            <label for="parent">Parent Page</label>
                            <select name="parent" class="form-select" id="">
                                <option value="0">N\A</option>
                                @foreach ($pages as $item)
                                    <option value="{{$item->id}}">{{ $item->name }}</option>
                                @endforeach
                            </select>
                        </div>


                        <br>
                        <button type="submit" class="btn btn-primary ">Save  <i class="fa fa-save    "></i> </button>

                    </div>

                </form>
           
        </div>

        {{-- @include('inc/right-sidebar') --}}
    </div>
</div>
@endsection

@section('scripts')
<script>
    CKEDITOR.replace('content');
</script>
@endsection
