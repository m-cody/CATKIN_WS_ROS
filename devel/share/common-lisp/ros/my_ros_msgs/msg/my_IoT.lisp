; Auto-generated. Do not edit!


(cl:in-package my_ros_msgs-msg)


;//! \htmlinclude my_IoT.msg.html

(cl:defclass <my_IoT> (roslisp-msg-protocol:ros-message)
  ((temperature
    :reader temperature
    :initarg :temperature
    :type cl:integer
    :initform 0)
   (humidity
    :reader humidity
    :initarg :humidity
    :type cl:fixnum
    :initform 0)
   (status
    :reader status
    :initarg :status
    :type cl:boolean
    :initform cl:nil)
   (location
    :reader location
    :initarg :location
    :type cl:string
    :initform ""))
)

(cl:defclass my_IoT (<my_IoT>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <my_IoT>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'my_IoT)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_ros_msgs-msg:<my_IoT> is deprecated: use my_ros_msgs-msg:my_IoT instead.")))

(cl:ensure-generic-function 'temperature-val :lambda-list '(m))
(cl:defmethod temperature-val ((m <my_IoT>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_ros_msgs-msg:temperature-val is deprecated.  Use my_ros_msgs-msg:temperature instead.")
  (temperature m))

(cl:ensure-generic-function 'humidity-val :lambda-list '(m))
(cl:defmethod humidity-val ((m <my_IoT>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_ros_msgs-msg:humidity-val is deprecated.  Use my_ros_msgs-msg:humidity instead.")
  (humidity m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <my_IoT>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_ros_msgs-msg:status-val is deprecated.  Use my_ros_msgs-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'location-val :lambda-list '(m))
(cl:defmethod location-val ((m <my_IoT>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_ros_msgs-msg:location-val is deprecated.  Use my_ros_msgs-msg:location instead.")
  (location m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <my_IoT>) ostream)
  "Serializes a message object of type '<my_IoT>"
  (cl:let* ((signed (cl:slot-value msg 'temperature)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'humidity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'status) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'location))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'location))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <my_IoT>) istream)
  "Deserializes a message object of type '<my_IoT>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'temperature) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'humidity)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'status) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'location) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'location) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<my_IoT>)))
  "Returns string type for a message object of type '<my_IoT>"
  "my_ros_msgs/my_IoT")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'my_IoT)))
  "Returns string type for a message object of type 'my_IoT"
  "my_ros_msgs/my_IoT")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<my_IoT>)))
  "Returns md5sum for a message object of type '<my_IoT>"
  "b6edeaa3532f795fb8e5e11041bdf1b5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'my_IoT)))
  "Returns md5sum for a message object of type 'my_IoT"
  "b6edeaa3532f795fb8e5e11041bdf1b5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<my_IoT>)))
  "Returns full string definition for message of type '<my_IoT>"
  (cl:format cl:nil "int64 temperature~%uint8 humidity~%bool status~%string location~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'my_IoT)))
  "Returns full string definition for message of type 'my_IoT"
  (cl:format cl:nil "int64 temperature~%uint8 humidity~%bool status~%string location~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <my_IoT>))
  (cl:+ 0
     8
     1
     1
     4 (cl:length (cl:slot-value msg 'location))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <my_IoT>))
  "Converts a ROS message object to a list"
  (cl:list 'my_IoT
    (cl:cons ':temperature (temperature msg))
    (cl:cons ':humidity (humidity msg))
    (cl:cons ':status (status msg))
    (cl:cons ':location (location msg))
))
