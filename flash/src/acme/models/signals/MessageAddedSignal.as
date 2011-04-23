package acme.models.signals
{
    import acme.models.vo.MessageVO;
    import org.osflash.signals.Signal;


    /**
     * @author Thomas Adam <thomas.adam@tecbot.de>
     */
    public class MessageAddedSignal extends Signal
    {
        public function MessageAddedSignal()
        {
            super(MessageVO);
        }
    }
}
