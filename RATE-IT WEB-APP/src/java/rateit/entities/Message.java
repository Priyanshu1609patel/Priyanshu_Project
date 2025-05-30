
package rateit.entities;


public class Message {
    
    private String msg_name;
    private String msg_type;//two types error message or success message

    public Message(String msg_name, String msg_type) {
        this.msg_name = msg_name;
        this.msg_type = msg_type;
    }

    public Message() {
    }

    public String getMsg_name() {
        return msg_name;
    }

    public void setMsg_name(String msg_name) {
        this.msg_name = msg_name;
    }

    public String getMsg_type() {
        return msg_type;
    }

    public void setMsg_type(String msg_type) {
        this.msg_type = msg_type;
    }
    
    
}
