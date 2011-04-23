package org.tecbot.amf
{
    import mx.messaging.ChannelSet;
    import mx.messaging.channels.AMFChannel;
    import mx.rpc.AsyncToken;
    import mx.rpc.Responder;
    import mx.rpc.remoting.Operation;

    /**
     * @author Thomas.Adam <thomas.adam@tecbot.de>
     */
    public class AMFManager implements IAMFManager
    {
        private var _channelSet : ChannelSet;
        private var _amfChannel : AMFChannel;
        private var _requests : Vector.<IAMFRequest> = new Vector.<IAMFRequest>();
        private var _lastCallTime : Number = 0;
        private var _endPoint : String;
        private var _gateway : String;

        public function get channelSet() : ChannelSet
        {
            return _channelSet;
        }

        public function get lastCallTime() : Number
        {
            return _lastCallTime;
        }

        public function AMFManager(endPoint : String = null, gateway : String = null)
        {
            _endPoint = endPoint;
            _gateway = gateway;

            _amfChannel = new AMFChannel(endPoint, gateway);
            _channelSet = new ChannelSet();
            _channelSet.addChannel(_amfChannel);
        }

        public function add(operation : Operation, onResult : Function, args : Object = null, onFault : Function = null) : void
        {
            _requests.push(createRequest(operation, onResult, args, onFault));
        }

        public function call(operation : Operation, onResult : Function, args : Object = null, onFault : Function = null) : void
        {
            callRequest(createRequest(operation, onResult, args, onFault));
        }

        public function callQueue(serverTime : Number) : void
        {
            while (0 < _requests.length) {
                callRequest(_requests.shift());
            }

            _lastCallTime = serverTime;
        }

        protected function callRequest(request : IAMFRequest) : void
        {
            var token : AsyncToken = request.operation.send(request.args);
            token.addResponder(new Responder(request.onResultHandler, request.onFaultHandler));
        }

        protected function createRequest(operation : Operation, onResult : Function, args : Object = null, onFault : Function = null) : IAMFRequest
        {
            var request : IAMFRequest = new AMFRequest(operation, args);
            request.onResult.addOnce(onResult);

            if (null != onFault) {
                request.onFault.addOnce(onFault);
            }

            return request;
        }
    }
}