<?php

namespace Acme\AmfBundle\AMF;

use Acme\AmfBundle\AMF\VO\MessageVO;

class DemoService
{
    public function sendMessageAction($message)
    {
        $newMessage = new MessageVO($message, time());
        $newMessage->message = $message;
        $newMessage->serverTime = time();

        return $newMessage;
    }
}