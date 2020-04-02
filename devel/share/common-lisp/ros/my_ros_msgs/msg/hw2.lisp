; Auto-generated. Do not edit!


(cl:in-package my_ros_msgs-msg)


;//! \htmlinclude hw2.msg.html

(cl:defclass <hw2> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform "")
   (command
    :reader command
    :initarg :command
    :type cl:fixnum
    :initform 0))
)

(cl:defclass hw2 (<hw2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <hw2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'hw2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_ros_msgs-msg:<hw2> is deprecated: use my_ros_msgs-msg:hw2 instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <hw2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_ros_msgs-msg:message-val is deprecated.  Use my_ros_msgs-msg:message instead.")
  (message m))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <hw2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_ros_msgs-msg:command-val is deprecated.  Use my_ros_msgs-msg:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <hw2>) ostream)
  "Serializes a message object of type '<hw2>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <hw2>) istream)
  "Deserializes a message object of type '<hw2>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<hw2>)))
  "Returns string type for a message object of type '<hw2>"
  "my_ros_msgs/hw2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'hw2)))
  "Returns string type for a message object of type 'hw2"
  "my_ros_msgs/hw2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<hw2>)))
  "Returns md5sum for a message object of type '<hw2>"
  "180698a25f3b4080cbf72c632befde42")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'hw2)))
  "Returns md5sum for a message object of type 'hw2"
  "180698a25f3b4080cbf72c632befde42")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<hw2>)))
  "Returns full string definition for message of type '<hw2>"
  (cl:format cl:nil "string message~%uint8 command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'hw2)))
  "Returns full string definition for message of type 'hw2"
  (cl:format cl:nil "string message~%uint8 command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <hw2>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <hw2>))
  "Converts a ROS message object to a list"
  (cl:list 'hw2
    (cl:cons ':message (message msg))
    (cl:cons ':command (command msg))
))
