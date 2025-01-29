import 'package:project_graduation/Core/Imports/common_imports.dart';

class CopyLinkButton extends StatefulWidget {
  final VoidCallback onCopy;

  const CopyLinkButton({Key? key, required this.onCopy}) : super(key: key);

  @override
  State<CopyLinkButton> createState() => _CopyLinkButtonState();
}

class _CopyLinkButtonState extends State<CopyLinkButton> {
  bool _isCopied = false;

  void _copyLink() {
    
    widget.onCopy(); 

    setState(() {
      _isCopied = true;
    });

    
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isCopied = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _copyLink,
      child: Container(
        width: width(context) * 0.9,
        height: height(context) * .09,
        alignment: Alignment.center,
        margin: EdgeInsets.only(
            left: width(context) * .05, right: width(context) * .05),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _isCopied ? Icons.check : Icons.copy,
              color: _isCopied ? Colors.green : ColorsClass.primary,
            ),
            Text(_isCopied ? ' Copied' : ' Copy Invitation Link',
                style: styling.subtitle.copyWith(
                  color: _isCopied ? Colors.green : ColorsClass.primary,
                )),
          ],
        ),
      ),
    );
  }
}
