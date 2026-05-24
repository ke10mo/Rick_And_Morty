import 'package:flutter/material.dart';
import 'package:lrn_cubt/constants/my_colors.dart';
import 'package:lrn_cubt/data/models/characters.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;
  const CharactersDetailsScreen({super.key, required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Hero(
          tag: character.id,
          child: character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: character.image,
                  fit: BoxFit.cover,
                )
              : const Image(
                  image: AssetImage('assets/images/no-image.png'),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  Widget detailsItem(String title, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title : ',
            style: const TextStyle(
              fontSize: 18,
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(fontSize: 16, color: MyColors.myWhite),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.myYellow,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detailsItem('Name', character.name),
                    buildDivider(210),
                    detailsItem('Status', character.status),
                    buildDivider(210),
                    detailsItem('Species', character.species),
                    buildDivider(210),
                    detailsItem(
                      'Type',
                      character.type.isEmpty ? 'Unknown' : character.type,
                    ),
                    buildDivider(210),
                    detailsItem('Gender', character.gender),
                    buildDivider(210),
                    detailsItem('Origin', character.origin.name),
                    buildDivider(210),
                    detailsItem('Location', character.location.name),
                    buildDivider(210),
                    detailsItem('Episode', character.episode.length.toString()),
                    buildDivider(210),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 500),
            ]),
          ),
        ],
      ),
    );
  }
}
