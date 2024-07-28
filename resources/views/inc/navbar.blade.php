<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow  border-bottom">
    <div class="container-fluid">
      <a class="navbar-brand" href="{{route('homepage')}}">PHP19</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link " aria-current="page" href="{{route('homepage')}}">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " aria-current="page" href="{{route('categories.all')}}">Categories</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " aria-current="page" href="{{route('tags.all')}}">Tags</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " aria-current="page" href="{{route('categories.posts', 'blog')}}">Blog</a>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Pages
            </a>
            <ul class="dropdown-menu">
                @php
                    $pages = App\Models\Page::select('name', 'slug')->where('status', 'published')->get();
                @endphp
                @foreach ($pages as $item)
                    @if($item->slug == '/')
                        {{-- Skip rendering for '/' slug --}}
                        @continue
                    @else 
                        <li><a class="dropdown-item text-capitalize" href="{{ url('pages/' . $item->slug) }}">{{ $item->name }}</a></li>
                    @endif
                @endforeach
        
            
            </ul>
          </li>

          <li class="nav-item">
            <a class="nav-link " aria-current="page" href="{{route('homepage')}}">Support</a>
          </li>
          
          @if(auth()->user() && auth()->user()->role == 'admin')
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Admin Tools
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="{{route('dashboard')}}">Dashboard</a></li>

              <li><a class="dropdown-item" href="{{route('admin.pages')}}">Pages</a></li>
              <li><a class="dropdown-item" href="{{route('admin.categories')}}">Categories</a></li>
              <li><a class="dropdown-item" href="{{route('admin.tags')}}">Tags</a></li>
              <li><a class="dropdown-item" href="{{route('admin.posts')}}">Posts</a></li>

            </ul>
          </li>
          @endif
        
        </ul>
        {{-- <form class="d-flex" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form> --}}
        <a class="btn btn-danger" href="{{env('YOUTUBE_LINK')}}"> <i class="fa fa-play" aria-hidden="true"></i> Youtube Channel</a>
      </div>
    </div>
  </nav>