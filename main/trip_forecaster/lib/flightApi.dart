import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class KayakSearchWidget extends StatefulWidget {
  final String startDate;
  final String endDate;

  const KayakSearchWidget({Key? key, required this.startDate, required this.endDate}) : super(key: key);

  @override
  _KayakSearchWidgetState createState() => _KayakSearchWidgetState();
}

class _KayakSearchWidgetState extends State<KayakSearchWidget> {
  final String _viewType = 'kayak-search-widget';

  @override
  void initState() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
      final containerElem = DivElement()
        ..style.width = '100%'
        ..style.height = '100%';

      final scriptElem = ScriptElement()
        ..src = 'https://www.kayak.com/affiliate/widget-v2.js';

      final initScriptElem = ScriptElement()
        ..innerHtml = '''
          KAYAK.embed({
            container: document.querySelector("#kayak-container"),
            startDate: "${widget.startDate}",
            endDate: "${widget.endDate}",
            enabledProducts: ["flights"]
          });
        ''';

      containerElem
        ..id = 'kayak-container'
        ..append(scriptElem)
        ..append(initScriptElem);

      return containerElem;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: HtmlElementView(
        viewType: _viewType,
      ),
    );
  }
}
