@foreach ($posts as $post)
    

<div class="card bg-black text-white mb-3 shadow">
    <div class="card-header bg-dark">
        <a href="http://" class="text-grey float-start">
            <img class="rounded" width="20px" height="20px" src="{{$post->user->photo}}" alt="{{$post->user->name}}">
            {{$post->user->name}}
        </a>
        <small class="float-end text-grey">Posted {{ $post->created_at->diffForHumans() }}</small>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-5">
                <img height="100%" width="100%" src="{{$post->thumbnail}}" alt="{{$post->keywords}}">
            </div>
            <a href="{{route('posts.details', $post->slug)}}" class="col-md-7">
               
                <b class="text-primary">{{$post->name}}</b>
                <br>
               
                <span class="text-grey">{{$post->description}}</span>
                <br>
               
                <span class="badge badge-pill bg-dark"> <i class="fa fa-eye" aria-hidden="true"></i> {{$post->views}}</span>
                <span class="badge badge-pill bg-dark"> <i class="fa fa-thumbs-up" aria-hidden="true"></i> {{$post->likes}} </span>
                <span class="badge badge-pill bg-dark"> <i class="fa fa-comments" aria-hidden="true"></i>  </span>
                <span class="badge badge-pill bg-dark"> <i class="fa fa-download" aria-hidden="true"></i> {{$post->downloads}} </span>
                <br>
                <span class="badge badge-pill text-dark bg-warning">{{$post->category->name}}</span>
                @foreach ($post->tags as $item)
                <span class="badge badge-pill text-white bg-primary">#{{$item->tag}}</span>

                @endforeach

                
            </a>
        </div>
    </div>
   
</div>

@endforeach