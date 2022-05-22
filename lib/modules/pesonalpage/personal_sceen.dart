import 'package:egytour/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../serach/search.dart';
import '../settings/editscreen.dart';

class personal extends StatefulWidget {
  @override
  _personalState createState() => _personalState();
}

class _personalState extends State<personal> {
  String avatarUrl =
      "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw0NDQ4NDQ0PDQ0NDQ0NDw0ODRANDQ0PFREWFhcRExUYHSggGBolHhUVITEiJykrLi4uGB8zODUsNyguLisBCgoKDg0OFQ8PFS0dHh4tLS0rListLSsyKy0rKy0tKysrLS0tKystKy0tLSstLS0rLS0rKysrKy0rLSstKystLf/AABEIALcBEwMBEQACEQEDEQH/xAAbAAEBAAMBAQEAAAAAAAAAAAAAAQMEBQIGB//EADYQAAIBAgQDBwEHBAMBAAAAAAABAgMRBBIhMUFRYQUTIjJxkaGBIzNCYnKxwRRSY7JDwvAk/8QAGgEBAQEBAQEBAAAAAAAAAAAAAAEDAgQGBf/EAC4RAQACAgAEBAUEAgMAAAAAAAABAgMRBBIhMQUiQVETMmFx0YGhscGR8DNCQ//aAAwDAQACEQMRAD8A/DQAAAAAAAKACAAoEUAACihAAAAAAAAAAAAEAAAABFQAACBRCKAAAAAAAoAIACgRQABSoAAAAAAAAAAAAAAAAAAioAAFQAhFAAAAAAAUAEABQIoAApUAAAAAAAAAAAAAACAUQigAAVAABCKAAAAAAAoAIACgRQAAAoAqAAAAAACAUAAAAACoQAAAAVAggUAAAAAABQAQAFAigACgABUAAAARQAAKgAAAAAVCAAAFQAAQigAAAAAAKEAAAoEUAAAAFKgAAAABFAAAAAKgAAhFAAAAECiEUAAAAAABQgAAAAoAApUAAAgFAAQdjsrsrNkq1rd29crveSto30M5yRE6l9D4Z4P8Tlz5/k9vf2/R03h8NJtd1CKWitFZpHHx4menSH7U8Fwl5mPhxGvp1eZ4OFNpd3FKW14xd+lzm971nq5twGDFMV+HEb+zgVcLNzqZabUYzkuSVntqbc8REbl8rk4PLbLk+Hj6RM/z9WvUg4u0k0+TOomJ6w8mTHbHPLeNS8lcAAABAAAAAAgAAAAAAAFCAAAUCKAAKUAgQABQIKkFiN9H09KnKWFpv8VNKlNcF/a/bT6HjyzFp5o9H22Ct54WkT3rGvwy0k42c1ZtaSeqa6Myjyy9WKdam/dkqYunx8TWytsdzdvficUd+s+jFa+ackrZWnfbbf1JuZjbDki2737acjF4FzTnHzRV2ucV/Jvhv/1fP8bwE5Kzlp3j94/LlHofPgAABAAAAAAgAAAAAAKACAAAUCKAUAUAgAIoBuUez6k1GStaXx6mVs1Y3D9HD4Xmy1reNasmBoSdS9rqm1KX8DJkiI+6cBw17Zt66U6y7FDEKKcb6PdHjmLej6bBxNKxyzPSXn+qnTbyyvF7p6xl6o6rvTK+e1LTqdw2MG4N5lFJtexaxuer18NOOZ5q102cRSvSa6X9tTa1fK9ObHzYphp4epljOb2jCUjjBHneGmSKY75J9Il8yj1viAAAAMCAUAAKjyRQAAAAAAFCAAAUCKAAAFAFQAEHV7O7QjBKMnZLToefJjne4fQeHeJUx0jHknWnQnOCu42tKN7rZnnvE7ftTfHEWmvrG/u58E5Sb4Gs9IfkUib3mfR7UkpJPZnOtx0axeK2iLdpb2Djlk481ddUKTuX6XDV5LzX37Osl4PoezXkfrRHlcDGxcadWnG/iklp/ak5v4iYYo1My+W8Sn4eC+OPWYj+3CPQ+ZABUCKgAABSgRHkKAAAAABQAQAACgRQAAApUABFCopFdDCV33eV7pSy9Y8V9GefJTzbfscFxO8M4p7xvX29f8N2jBKFzC3WX6+GkVxbYa0Lo6rPV5s1N1ZsHW1jfeL+HuJ6Tt6eEzTPLE94dyrPRJHstbpEP3b26REOXiKkZYbEVlzlSXVyypfGb3PJM7yVr9dvjPFuJjLbp7z+HzJ7H4wAAAQAAAoADyAAAAAACgAgAAFAigAClAIAAAAg2MJdvKvN5odZL8P1V/g4v220x3mlomHWhNSp+Hbc80xqdS+rpkjJh3V7wKzU6qavKFNW9M8bv2M8k6mv1/DyRl+SlvfX7Tpiow+0Xo7+xpHWHox01mj9XUxNS1OcuKpu3rY377frcRk5cN7e0S5PbEu5oUcKvP8AfVeknsn/AO4IxwRz5LZPTtH9vgcluaXFPW4AAACAAAAABAAAAAAAUAEABQAEUAAUoBAAAAAVO22jXHiiDdpY626s3vZeGT59GZfDezh+Mvh6R1h2OycZh5QlCMX303Z33dPiofTXnp0PJxGK+4mO0fymbi7ZJiY6aa86UqbnOE4VKai5Np+NR5NcGaYrxOomNS9OLxK1Z3MNaXayeuWTs01BtZLrZya1kr620PTNZno44nxLNmrNZ6Q5tarKcnObcpSd23xOq1isah+e8FAIBQCAAAAABAAAAAAAUIAABQIoAAAUoBAAAAAABB6p1JQkpxdpRalFrg1sxMb6SN6VZ91W/wAiiums4y/6mERHNH0bXjy7aBuyQAVAigEAAAAAABAAAAAAoAIACgAIoAAoAqAAAAAEAoEAo6Ekv6eX6aT+bHmj/kj9W9p8jnnoYgAqAEIoAAAAAACAAAAABQAQAFAgBQAAApUCAAAAAAAABvyf/wA7/RD/AHMP/T/fZrPyNA3ZgACAAAAAECgQCiEUAAAAFABAAUAAAigAClQA69ChTnh4RnFqfilGSVpZbvS/FcTyWtaLzMS5tbUsNTs1bqpZaeZcG+n04GkZfeCLNWphJrZKa/Jr8b/BpF4l1tgOwIBQIrq4ZvLkjZydFPxJOKWt3K+iWvE81/m3Pu215WvPALJOdOrCr3UVKpGKleKbSunazV2aRl6xFqzG+zFpGyAEIoAAFQIAAABAoAAAUAEABQAEUAAABRQgB9FRpRtTSbSVOL8trqyd7Lndnh72n7s57r/Txb81tHr15HUQm2Orh7pbvTRnUK0cRST0nvtmXmWnHmvk0raYdRLQnFxbT4ctn1NYnbp5KOhgKMIQeJqpNRbVKm/+WouPWKuYZLWm0Ur+s+0fl1HTq84mtKVNydrzUE2ko3462FaxFtNbW8jWhXnGEqadoTazJfis00n0ukzSaRMxafRixHaBFQAAABAAACgEAAAAFCAAAUABFAKAAAQooR3uya+aMNfFBZZXb4Xt6afseS9dWn6uLR1b2IceMW21re9n7IbcsVOrF7rRQcU/zX4/S5YlWniIKyb46vojqBpYx05wTgmpU2oyv+JO9va3yaU6O4aJo6WUm7XbdlZXd7LkuhBs1n9jHnmj/oZ1+aWlvlhqmrIAhFAAAqBAAgUAAAAAABQgAAFAigFKgAAACKFRmwuJlSlmjbVWae0lyObVi0ak1t3qOLckpRbUZaq/TR3PLMTE6ZTGmz9pLwuCmnfRSg7+pZGticPLaSy6PinZZdE7MbVwKsLN+nL8yN6zt3C0cNOaukrc29xbJFe6zLxWoyg7SVv2Z1W0W7G25HDupS3UVB3bk7LypJXMuaIs3mu692COEbvapSbXDvVF+70+Tvn+k/4YvMsLNb5df8lN/wAl54R4q0pwtmi432utH6PiWJieysZQCBQAEACBQAAAAAKACAAAFABQAEFKgAAAbODxbpN6KUXvF8+a6nFqRZJjbq4btujBfdVL8fFGRx8NzyvVTtihUfijOPWy14PZknFJytPtSEe7U6bjKEpqOZO7i0n4X+/06DHOrcs93VYeKTcfDd6Rja6tro2ve5zfr1cyyt94nCSum733aevE5jpOyvdoYp7JdZe7N6estr92uduQDPh8VOnorSjxpyWaD+hzakSNynQo4j7v7KpvkveMv0mU2vTv1hGnicJUpWzxaT8sreGXozatonsMB0BAAAQKAAAAAAAoQAAAoAApRCClQAAAAADJQoyqSyxWu/RLmzmbRA6ccHCnaMajqKpG1Tw5YXvw6rmYXvtxzvfaEKmHn9pTlFSjGWaMs15W0lrtd306s6rHNCxDBVnFwjUg/M8vVSa2OYrMTp1SPM0cTpOS5WX0SNqdoWZ3LCdAAAqdtVutQNuWNdSCp1rySd4zXng+fX0OIpqdwNSSs2r368zsQqBAAgUAAAAACgAgUCKAAKUAIQUqAAAAAAdjsunDub3eZttq26WiV/f3PPknzacWbab0XBu3Ha+py5MS3Xdpa2urdONmXeuyx3cqpSdGCT82ac+aSTcI/Kl7I03zS9EdK7aUpNu7d2+JpEaZvIUAAAAAqBFAgAABX//Z";

  List<String> imagePost = [
    "https://c8.alamy.com/comp/2CCY1FC/3d-render-illustration-of-frightening-and-sad-ghost-sign-on-isolatet-white-2CCY1FC.jpg"
        "https://c8.alamy.com/comp/2B7C0CX/ceramic-piggy-bank-laying-on-its-side-useful-for-poor-or-failing-economy-concept-white-background-with-ample-copy-space-2B7C0CX.jpg"
        "https://www.promarket.org/wp-content/uploads/2019/03/goldfish.jpg"
        "https://lensvid.com/wp-content/uploads/2016/01/How-to-Add-Film-Effects-to-Any-Photo.jpeg"
        "https://media.istockphoto.com/photos/young-woman-checking-if-there-are-any-split-ends-after-getting-her-picture-id1349298933?b=1&k=20&m=1349298933&s=170667a&w=0&h=ClnQ1yEv9L6NQYYW-NtLTAgrv94Lhv8GAoGbOd919tU="
        "https://st2.depositphotos.com/3837271/8400/i/950/depositphotos_84002888-stock-photo-any-questions-written-on-a.jpg"
  ];
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 7.0,
        title: const Text(
          "Personal Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'search here',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              navigateto(context, SearchScreen());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/assiut.jpg"))),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text("Maichel Magdy",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )),
            const Text("@maichel.magdy",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0,
                )),
            const SizedBox(
              height: 23.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                statWidget("Posts", "120"),
                statWidget("Followers", "130k"),
                statWidget("Following", "12"),
              ],
            ),
            const SizedBox(height: 12.0),
            FlatButton(
              onPressed: () {
                navigateto(context, EditScreen());
              },
              color: Colors.amberAccent,
              splashColor: Colors.grey,
              child: const Text(
                "Edit Profile",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 120.0, vertical: 8.0),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                height: 18.0,
                thickness: 0.8,
                color: Colors.black87,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: imagePost.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(imagePost[index]),
                            )),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget statWidget(String title, String state) {
  return Expanded(
    child: Column(
      children: [
        Text(
          state,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11.0,
          ),
        ),
      ],
    ),
  );
}
