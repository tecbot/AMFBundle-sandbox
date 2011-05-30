<?php

namespace Acme\AmfBundle\Tests\Functional;

use Tecbot\AMFBundle\Test\WebTestCase;

class DemoServiceTest extends WebTestCase
{
    public function testSendMessage()
    {
        $client = $this->createAmfClient();

        $response = $client->amfRequest('DemoService.sendMessage', "Hello World");
        $this->assertInstanceOf('Acme\AmfBundle\AMF\VO\MessageVO', $response);
        $this->assertEquals("Hello World", $response->message);
    }
}
