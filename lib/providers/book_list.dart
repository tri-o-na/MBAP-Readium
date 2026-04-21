// import 'package:flutter/material.dart';
//
// import '../models/book.dart';
//
// class BookList with ChangeNotifier {
//   List<Book>  myBooks = [
//     Book(id: 1, imageUrl: 'https://i.harperapps.com/covers/9780062310637/x300.jpg',
//         bookName:'Red Queen', authorName: 'Victoria Aveyard',
//         seriesName:"Red Queen", seriesNo:1, language: 'English',
//         dateTimeAdded: DateTime.now().subtract(Duration(days: 3)),
//         favourite: 0, toBeRead: 0, haveRead: 0, trash: 0,
//         description: "This is a world divided by blood—red or silver. The Reds are commoners, ruled by a Silver elite in possession of god-like superpowers. And to Mare Barrow, a seventeen-year-old Red girl from the poverty-stricken Stilts, it seems like nothing will ever change. That is until she finds herself working in the Silver Palace. Here, surrounded by the people she hates the most, Mare discovers that, despite her red blood, she possesses a deadly power of her own. One that threatens to destroy the balance of power. Fearful of Mare's potential, the Silvers hide her in plain view, declaring her a long-lost Silver princess, now engaged to a Silver prince. Despite knowing that one misstep would mean her death, Mare works silently to help the Red Guard, a militant resistance group, and bring down the Silver regime. But this is a world of betrayal and lies, and Mare has entered a dangerous dance-Reds against Silvers, prince against prince, and Mare against her own heart."),
//     Book(id: 2, imageUrl: 'https://i.harperapps.com/covers/9780062310668/x300.jpg',
//         bookName:'Glass Sword', authorName: 'Victoria Aveyard',
//         seriesName:"Red Queen", seriesNo:2, language: 'English',
//         dateTimeAdded: DateTime.now().subtract(Duration(days: 1)),
//         favourite: 0, toBeRead: 0, haveRead: 0, trash: 0,
//         description: "Mare Barrow’s blood is red—the color of common folk—but her Silver ability, the power to control lightning, has turned her into a weapon that the royal court tries to control. The crown calls her an impossibility, a fake, but as she makes her escape from Maven, the prince-the friend-who betrayed her, Mare uncovers something startling: she is not the only one of her kind. Pursued by Maven, now a vindictive king, Mare sets out to find and recruit other Red-and-Silver fighters to join in the struggle against her oppressors. But Mare finds herself on a deadly path, at risk of becoming exactly the kind of monster she is trying to defeat. Will she shatter under the weight of the lives that are the cost of rebellion? Or have treachery and betrayal hardened her forever. The electrifying next installment in the Red Queen series escalates the struggle between the growing rebel army and the blood-segregated world they’ve always known—and pits Mare against the darkness that has grown in her soul."),
//     Book(id: 3, imageUrl: 'https://i.harperapps.com/covers/9780062310699/x300.jpg',
//         bookName:'Kings Cage', authorName: 'Victoria Aveyard',
//         seriesName:"Red Queen", seriesNo:3, language: 'English',
//         dateTimeAdded: DateTime.now().subtract(Duration(days: 4)),
//         favourite: 0, toBeRead: 0, haveRead: 0, trash: 0,
//         description: "In this breathless third installment to Victoria Aveyard’s bestselling Red Queen series, allegiances are tested on every side. And when the Lightning Girl's spark is gone, who will light the way for the rebellion? Mare Barrow is a prisoner, powerless without her lightning, tormented by her lethal mistakes. She lives at the mercy of a boy she once loved, a boy made of lies and betrayal. Now a king, Maven Calore continues weaving his dead mother's web in an attempt to maintain control over his country—and his prisoner. As Mare bears the weight of Silent Stone in the palace, her once-ragtag band of newbloods and Reds continue organizing, training, and expanding. They prepare for war, no longer able to linger in the shadows. And Cal, the exiled prince with his own claim on Mare's heart, will stop at nothing to bring her back. When blood turns on blood, and ability on ability, there may be no one left to put out the fire—leaving Norta as Mare knows it to burn all the way down."),
//     Book(id: 4, imageUrl: 'https://i.harperapps.com/covers/9780062423009/x300.jpg',
//         bookName:'War Storm', authorName: 'Victoria Aveyard',
//         seriesName:"Red Queen", seriesNo:4, language: 'English',
//         dateTimeAdded: DateTime.now().subtract(Duration(days: 8)),
//         favourite: 0, toBeRead: 0, haveRead: 0, trash: 0,
//         description: 'Return once more to the deadly and dazzling world of Red Queen '+
//         'in Broken Throne, a beautifully designed, must-have companion '+
//         'to the chart-topping series from #1 New York Times bestselling '+
//         'author Victoria Aveyard. '+
//         'The perfect addition to the #1 New York Times bestselling Red '+
//         'Queen series, this gorgeously designed package features three '+
//         'brand-new novellas, two previously published novellas, Steel '+
//         'Scars and Queen Song, and never-before-seen maps, flags, '+
//         'bonus scenes, journal entries, and much more exclusive content. '+
//         'Fans will be delighted to catch up with beloved characters after '+
//         'the drama of War Storm and be excited to hear from brand-new '+
//         'voices as well. This stunning collection is not to be missed! '),
//     Book(id: 5, imageUrl: 'https://i.harperapps.com/covers/9780062423030/x300.jpg',
//         bookName:'Broken Throne', authorName: 'Victoria Aveyard',
//         seriesName:"Red Queen", seriesNo:5, language: 'English',
//         dateTimeAdded: DateTime.now().subtract(Duration(days: 2)),
//         favourite: 0, toBeRead: 0, haveRead: 0, trash: 0,
//         description: "Mare Barrow learned this all too well when Cal’s betrayal nearly destroyed her. Now determined to protect her heart—and secure freedom for Reds and newbloods like her—Mare resolves to overthrow the kingdom of Norta once and for all… starting with the crown on Maven’s head. But no battle is won alone, and before the Reds may rise as one, Mare must side with the boy who broke her heart in order to defeat the boy who almost broke her. Cal’s powerful Silver allies, alongside Mare and the Scarlet Guard, prove a formidable force. But Maven is driven by an obsession so deep, he will stop at nothing to have Mare as his own again, even if it means demolishing everything—and everyone—in his path. War is coming, and all Mare has fought for hangs in the balance. Will victory be enough to topple the Silver kingdoms? Or will the little lightning girl be forever silenced? In the epic conclusion to Victoria Aveyard’s stunning series, Mare must embrace her fate and summon all her power… for all will be tested, but not all will survive."),
//     Book(id: 6, imageUrl: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1494896884l/28421168.jpg',
//           bookName:'Renegades', authorName: 'Marissa Meyer',
//         seriesName:"Renegades", seriesNo:1, language: 'English',
//         dateTimeAdded: DateTime.now().subtract(Duration(days: 5)),
//         favourite: 0, toBeRead: 0, haveRead: 0, trash: 0,
//         description: "The Renegades are a syndicate of prodigies — humans with extraordinary abilities — who emerged from the ruins of a crumbled society and established peace and order where chaos reigned. As champions of justice, they remain a symbol of hope and courage to everyone... except the villains they once overthrew. Nova has a reason to hate the Renegades, and she is on a mission for vengeance. As she gets closer to her target, she meets Adrian, a Renegade boy who believes in justice — and in Nova. But Nova's allegiance is to a villain who has the power to end them both."),
//     Book(id: 7, imageUrl: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1526668679l/35425827._SX318_.jpg',
//         bookName:'Archenemies', authorName: 'Marissa Meyer',
//         seriesName:"Renegades", seriesNo:2, language: 'English',
//         dateTimeAdded: DateTime.now().subtract(Duration(days: 5)),
//         favourite: 0, toBeRead: 0, haveRead: 0, trash: 0,
//         description: "The Renegades Trilogy continues, in this fiercely awaited second installment after the New York Times-bestselling Renegades by Marissa Meyer, author of the Lunar Chronicles. "+
//             "Time is running out. "+
//             "Together, they can save the world. "+
//             "But they each other's worst nightmare. "+
//             "In Renegades, Nova and Adrian (aka Insomnia and Sketch) fought the battle of their lives against the Anarchist known as the Detonator. It was a short-lived victory. "+
//             "The Anarchists still have a secret weapon, one that Nova believes will protect her. The Renegades also have a strategy for overpowering the Anarchists, but both Nova and Adrian understand that it could mean the end of Gatlon City - and the world - as they know it."),
//     Book(id: 8, imageUrl: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1557159835l/42771754.jpg',
//         bookName:'Supernova', authorName: 'Marissa Meyer',
//         seriesName:"Renegades", seriesNo:3, language: 'English',
//         dateTimeAdded: DateTime.now().subtract(Duration(days: 5)),
//         favourite: 0, toBeRead: 0, haveRead: 0, trash: 0,
//         description: "The epic conclusion to Marissa Meyer's thrilling Renegades Trilogy finds Nova and Adrian fighting to keep their identities secret. While the battle rages on between their alter egos and their allies, there is a darker threat shrouding Gatlon City. "+
//             "The Renegades' worst enemy is back among them, threatening to reclaim Gatlon City. Nova and Adrian must brave lies and betrayal to protect those they love. Their greatest fears are about to come to life, and unless they can bridge the divide between heroes and villains, they stand to lose everything. Including each other. "+
//             "Intrigue and action will leave readers on edge until the final, shocking secrets are revealed. "),
//     Book(id: 9, imageUrl: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1494333138l/33385229._SY475_.jpg",
//         bookName: "They Both Die at the End", authorName: 'Adam Silvera',
//         seriesName: "Death-Cast",  seriesNo:1, language: 'English',
//         dateTimeAdded: DateTime.now().subtract(Duration(days: 0)),
//         favourite: 0, toBeRead: 0, haveRead: 0, trash: 0,
//         description: "On September 5, a little after midnight, Death-Cast calls Mateo Torrez and Rufus Emeterio to give them some bad news: They’re going to die today.Mateo and Rufus are total strangers, but, for different reasons, they’re both looking to make a new friend on their End Day. The good news: There’s an app for that. It’s called the Last Friend, and through it, Rufus and Mateo are about to meet up for one last great adventure—to live a lifetime in a single day.",),
//     Book(id: 10, imageUrl: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1638308667l/59731777._SY475_.jpg",
//         bookName: "The First to Die at the End", authorName: 'Adam Silvera',
//         seriesName: "Death-Cast",  seriesNo:0, language: 'English',
//         dateTimeAdded: DateTime.now().subtract(Duration(days: 0)),
//         favourite: 0, toBeRead: 0, haveRead: 0, trash: 0,
//         description: "In this prequel to #1 New York Times bestselling phenomenon They Both Die at the End, two new strangers spend a life-changing day together after Death-Cast first makes their fateful calls. It’s the night before Death-Cast goes live, and there’s one question on everyone’s mind: Can Death-Cast actually predict when someone will die, or is it just an elaborate hoax? "+
//             "Orion Pagan has waited years for someone to tell him that he’s going to die. He has a serious heart condition, and he signed up for Death-Cast so he could know what’s coming. "+
//             "Valentino Prince is restarting his life in New York. He has a long and promising future ahead and he only registered for Death-Cast after his twin sister nearly died in a car accident. "+
//             "Orion and Valentino cross paths in Times Square and immediately feel a deep connection. But when the first round of End Day calls goes out, their lives are changed forever—one of them receives a call, and the other doesn’t. Though neither boy is certain how the day will end, they know they want to spend it together…even if that means their goodbye will be heartbreaking. "+
//             "Told with acclaimed author Adam Silvera’s signature bittersweet touch, this story celebrates the lasting impact that people have on each other and proves that life is always worth living to the fullest.",),
//     Book(id: 11, imageUrl: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1562781746l/34510711._SY475_.jpg",
//         bookName: "Infinity Son", authorName: 'Adam Silvera',
//         seriesName: "Infinity Cycle",  seriesNo:1, language: 'English',
//         dateTimeAdded: DateTime.now().subtract(Duration(days: 0)),
//         favourite: 0, toBeRead: 0, haveRead: 0, trash: 0,
//         description: "Balancing epic and intensely personal stakes, bestselling author Adam Silvera’s Infinity Son is a gritty, fast-paced adventure about two brothers caught up in a magical war generations in the making. "+
//             "Growing up in New York, brothers Emil and Brighton always idolized the Spell Walkers—a vigilante group sworn to rid the world of specters. While the Spell Walkers and other celestials are born with powers, specters take them, violently stealing the essence of endangered magical creatures. "+
//             "Brighton wishes he had a power so he could join the fray. Emil just wants the fighting to stop. The cycle of violence has taken a toll, making it harder for anyone with a power to live peacefully and openly. In this climate of fear, a gang of specters has been growing bolder by the day. "+
//             "Then, in a brawl after a protest, Emil manifests a power of his own—one that puts him right at the heart of the conflict and sets him up to be the heroic Spell Walker Brighton always wanted to be. "+
//             "Brotherhood, love, and loyalty will be put to the test, and no one will escape the fight unscathed.",),
//     Book(id: 12, imageUrl: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1592763131l/53018247.jpg",
//         bookName: "Infinity Reaper", authorName: 'Adam Silvera',
//         seriesName: "Infinity Cycle",  seriesNo:2, language: 'English',
//         dateTimeAdded: DateTime.now().subtract(Duration(days: 0)),
//         favourite: 0, toBeRead: 0, haveRead: 0, trash: 0,
//         description: "In this gripping sequel to the New York Times bestselling Infinity Son, Adam Silvera brings a diverse cast of heroes and villains to life in an alternate New York where some people are born with powers, while others steal them from the blood of endangered magical creatures. "+
//             "Emil and Brighton defied the odds. They beat the Blood Casters and escaped with their lives—or so they thought. When Brighton drank the Reaper's Blood, he believed it would make him invincible, but instead the potion is killing him. "+
//             "In Emil's race to find an antidote that will not only save his brother but also rid him of his own unwanted phoenix powers, he will have to dig deep into the very past lives he's trying to outrun. Though he needs the help of the Spell Walkers now more than ever, their ranks are fracturing, with Maribelle's thirst for revenge sending her down a dangerous path. "+
//             "Meanwhile, Ness is being abused by Senator Iron for political gain, his rare shifting ability making him a dangerous weapon. As much as Ness longs to send Emil a signal, he knows the best way to keep Emil safe from his corrupt father is to keep him at a distance. "+
//             "The battle for peace is playing out like an intricate game of chess, and as the pieces on the board move into place, Emil starts to realize that he may have been competing against the wrong enemy all along..",),
//   ];
//   List<Book> getMyBooks() {
//     return myBooks;
//   }
//   // void addBook(newBook) {
//   //   myBooks.insert(0, newBook);
//   //   notifyListeners();
//   // }
//   void removeBook(i) {
//     myBooks.removeAt(i);
//     notifyListeners();
//   }
// }
