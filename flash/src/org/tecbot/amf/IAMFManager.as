package org.tecbot.amf
{
    import mx.messaging.ChannelSet;
    import mx.rpc.remoting.Operation;

    /**
     * @author Thomas Adam <thomas.adam@tecbot.de>
     */
    public interface IAMFManager
    {
        function get channelSet() : ChannelSet;

        function get lastCallTime() : Number;

        function add(operation : Operation, onResult : Function, args : Object = null, onFault : Function = null) : void;

        function call(operation : Operation, onResult : Function, args : Object = null, onFault : Function = null) : void;

        function callQueue(serverTime : Number) : void;
    }
}
