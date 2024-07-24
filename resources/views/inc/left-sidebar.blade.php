<div class="col-md-2 bg-black shadow border-end pt-4">

    <h6 class="text-light">Categories</h6>
    @php
        $cats = App\Models\Category::all();
    @endphp
    @foreach ($cats as $item)
        <a href="{{route('categories.posts', $item->slug)}}" class="btn btn-sm btn-light mb-2">{{$item->name}}</a>
        <br>
    @endforeach
 

    <hr class="bg-light text-light">
    <h6 class="text-light">Tags</h6>
    @php
        $tags = App\Models\Tag::all();
    @endphp
    @foreach ($tags as $item)
        <a href="{{route('tags.posts', $item->slug)}}" class="text-primary mb-2 tags btn btn-sm btn-light"># {{$item->tag}}</a>
        <br>
    @endforeach
   

</div>