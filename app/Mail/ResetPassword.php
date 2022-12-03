<?php
 
namespace App\Mail;
 
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
 
class ResetPassword extends Mailable
{
    use Queueable, SerializesModels;
 
    protected $code = null;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($code)
    {
        $this->code = $code;
    }
 
    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $code = $this->code;
        return $this->view('emails.template', compact('code'));
    }
}