package acme.view.signals
{
    import org.osflash.signals.Signal;

    /**
     * @author Thomas Adam <thomas.adam@tecbot.de>
     */
    public class SendMessageSignal extends Signal
    {
        public function SendMessageSignal()
        {
            super(String);
        }
    }
}
