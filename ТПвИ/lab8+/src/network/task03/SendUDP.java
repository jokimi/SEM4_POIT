
package network.task03;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

// udp
public class SendUDP {
    private DatagramSocket socket;


    public SendUDP(int port) throws SocketException {
        // один параметр перегруженной ф-ии,значит коннектимся к определенному порту на локальной машине
        socket = new DatagramSocket(port);
    }


    public void sendMessages(String messages, int port) throws IOException {
        // ф-ия для отправки сообщения,тут все просто
        DatagramPacket message = new DatagramPacket(messages.getBytes(), messages.getBytes().length, InetAddress.getLocalHost(), port);
        socket.send(message);
    }


    public static void main(String[] args) throws IOException {
        SendUDP udp = new SendUDP(1234);
        udp.sendMessages("Hi sisters I'm jokimi", 4321);
    }
}