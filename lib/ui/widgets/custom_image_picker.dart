import "package:flutter/material.dart";


class CustomImagePicker extends StatefulWidget {
  List<String> images;

  CustomImagePicker({
    required this.images,
    Key? key}) : super(key: key);

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            child: Row(
              children: const [
                Icon(Icons.add),
                Text("Add Image", style: TextStyle(color: Colors.black),)
              ],
            ),
            onPressed: (){
              setState(() {
                // widget.images.removeLast();
                widget.images.add("temp");
              });

            },
          ),

        if (widget.images.isNotEmpty)
          _ImageRow(
            images: widget.images
          )

      ],
    );
  }
}







class _ImageRow extends StatelessWidget {
  final List<String> images;
  const _ImageRow({
    Key? key,
    required this.images
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context,index) => _ImageTile(),
      ),
    );
  }
}





class _ImageTile extends StatelessWidget {
  const _ImageTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.2,
      height: size.height * 0.1,
      margin: EdgeInsets.symmetric(horizontal: 4),
      color: Colors.yellow
    );
  }
}

