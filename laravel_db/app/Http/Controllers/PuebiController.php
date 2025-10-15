<?php
namespace App\Http\Controllers;
use App\Models\PuebiEntry;
use Illuminate\Http\Request;
use League\CommonMark\CommonMarkConverter; // or Parsedown

class PuebiController extends Controller
{
    protected $md;
    public function __construct()
    {
        // gunakan league/commonmark (install: composer require league/commonmark)
        $this->md = new CommonMarkConverter();
    }

    public function index()
    {
        $entries = PuebiEntry::select('id','slug','title')->orderBy('id')->get();
        return view('puebi.index', compact('entries'));
    }

    public function show($slug)
    {
        $entry = PuebiEntry::where('slug',$slug)->firstOrFail();
        $html = $this->md->convert($entry->content_markdown);
        return view('puebi.show', compact('entry','html'));
    }
}
