class JWTDAO {
  JWTDAO({this.clientEmail, this.clientId, this.privateKeyId, this.privateKey});
  factory JWTDAO.fromJson(Map<String, dynamic> json) => switch (json) {
    {
      "client_email": final String? clientEmail,
      "client_id": final String? clientId,
      "client_key_id": final String? clientKeyId,
      "client_key": final String? clientKey,
    } => JWTDAO(clientEmail: clientEmail, clientId: clientId, privateKey: clientKey, privateKeyId: clientKeyId),
    _ => JWTDAO()
  };
  

  String? clientEmail;
  String? clientId;
  String? privateKeyId;
  String? privateKey;

  
  Map<String, dynamic> toJson() => {
      'client_email': clientEmail,
      'client_id': clientId,
      'private_key_id': privateKeyId,
      'private_key': privateKey,
  };
}
