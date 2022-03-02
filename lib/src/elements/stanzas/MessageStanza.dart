import 'package:xmpp_stone/src/elements/XmppAttribute.dart';
import 'package:xmpp_stone/src/elements/XmppElement.dart';
import 'package:xmpp_stone/src/elements/stanzas/AbstractStanza.dart';

class MessageStanza extends AbstractStanza {
  late MessageStanzaType _type;

  MessageStanzaType get type => _type;

  set type(MessageStanzaType value) {
    _type = value;
  }

  MessageStanza(id, type) {
    name = 'message';
    this.id = id;
    _type = type;
    addAttribute(XmppAttribute('type', _type.toString().split('.').last.toLowerCase()));
  }

  String get body {
    try {
      return children.firstWhere((child) => (child.name == 'body' && child.attributes.isEmpty)).textValue;
    } catch (e) {
      return '';
    }
  }

  set body(String value) {
    var element = XmppElement();
    element.name = 'body';
    element.textValue = value;
    addChild(element);
  }

  String get subject {
    try {
      return children.firstWhere((child) => (child.name == 'subject')).textValue;
    } catch(e) {
      return '';
    }
  }

  set subject(String value) {
    var element = XmppElement();
    element.name = 'subject';
    element.textValue = value;
    addChild(element);
  }

  String get thread {
    try {
      return children.firstWhere((child) => (child.name == 'thread')).textValue;
    } catch(e) {
      return '';
    }
  }

  set thread(String value) {
    var element = XmppElement();
    element.name = 'thread';
    element.textValue = value;
    addChild(element);
  }
}

enum MessageStanzaType { CHAT, ERROR, GROUPCHAT, HEADLINE, NORMAL, UNKOWN }
