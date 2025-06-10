import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/post/update_page/widgets/post_update_form.dart';

import '../../../../../data/model/post.dart';

class PostUpdateBody extends StatelessWidget {
  Post post;


  PostUpdateBody(this.post);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: PostUpdateForm(post),
    );
  }
}