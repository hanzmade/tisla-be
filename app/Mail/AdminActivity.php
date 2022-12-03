<?php
 
namespace App\Mail;
 
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
 
class AdminActivity extends Mailable
{
    use Queueable, SerializesModels;
 
    protected $title = null;
    protected $body = null;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($title, $body)
    {
        $this->title = $title;
        $this->body = $body;
    }
 
    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $title = $this->title;
        $body = $this->body;
        return $this->view('emails.admin-activity', compact('title','body'));
    }
}