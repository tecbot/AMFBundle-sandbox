package org.tecbot.amf
{
    import org.osflash.signals.ISignal;
    import org.osflash.signals.Signal;

    import mx.rpc.events.FaultEvent;
    import mx.rpc.events.ResultEvent;
    import mx.rpc.remoting.Operation;

    /**
     * @author Thomas.Adam <thomas.adam@tecbot.de>
     */
    public class AMFRequest implements IAMFRequest
    {
        protected var _operation : Operation;
        protected var _args : Object;
        protected var _onResult : Signal = new Signal(ResultEvent);
        protected var _onFault : Signal = new Signal(FaultEvent);

        public function get operation() : Operation
        {
            return _operation;
        }

        public function get args() : Object
        {
            return _args;
        }

        public function get onResult() : ISignal
        {
            return _onResult;
        }

        public function get onFault() : ISignal
        {
            return _onFault;
        }

        public function AMFRequest(operation : Operation, args : Object = null)
        {
            _operation = operation;
            _args = args;
        }

        public function onResultHandler(event : ResultEvent) : void
        {
            _onResult.dispatch(event);
            removeListeners();
        }

        public function onFaultHandler(event : FaultEvent) : void
        {
            _onFault.dispatch(event);
            removeListeners();
        }

        public function removeListeners() : void
        {
            _onResult.removeAll();
            _onFault.removeAll();
        }
    }
}
