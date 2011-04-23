package org.tecbot.amf
{
    import org.osflash.signals.ISignal;

    import mx.rpc.events.FaultEvent;
    import mx.rpc.events.ResultEvent;
    import mx.rpc.remoting.Operation;

    /**
     * @author Thomas.Adam <thomas.adam@tecbot.de>
     */
    public interface IAMFRequest
    {
        function get operation() : Operation;

        function get args() : Object;

        function get onResult() : ISignal;

        function get onFault() : ISignal;

        function onResultHandler(event : ResultEvent) : void;

        function onFaultHandler(event : FaultEvent) : void;

        function removeListeners() : void;
    }
}
