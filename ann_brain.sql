DROP TABLE IF EXISTS projects;

CREATE TABLE IF NOT EXISTS `projects` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `title` TEXT NOT NULL,
    `subtitle` TEXT NOT NULL,
    `year` INTEGER NOT NULL,
    `location` TEXT NOT NULL,
    `industry` TEXT NOT NULL,
    `area` INTEGER NOT NULL,
    `status` TEXT NOT NULL,
    `content` TEXT NOT NULL
);

INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Static Web Development','CMT119 Coursework','2023','Cardiff','Web Development','0','Conceptual Project','In this coursework, I employed the approach of Computational Thinking. First, I broke it down into smaller problems, then further decomposed those problems into even smaller issues. After pondering, I wrote down the answers and finally organized them into a mind map. This mind map also served as the blueprint for constructing the framework and content of my website. Based on it, I proceeded to design the layout of the pages in PowerPoint, and finally realized my ideas using HTML and CSS. This process allowed me to appreciate the charm of Computational Thinking and logical reasoning.');
INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Fuyang Science and Technology Museum Design Project','以竹为骨、折纸成扇','2022','FuYang','Architecture','14870','Under Construction','Using bamboo as the frame, folding paper into a fan. Considering the demands of contemporary technology museums for fewer columns, flexible and changeable large spaces, and the need for large-span structures, this parallels the artistic features of traditional folk bamboo fans and bamboo paper craftsmanship. Therefore, this project, while completing the analysis of modern structural systems, also draws on the wisdom and spatial aesthetics of traditional crafts, achieving two aims in one stroke.');
INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Envision Gorup Industrial Pakr Desgin Project','Experiment of Standardized Factory Buildings','2022','BengBu','Architecture','27039','Under Construction','This project aims to leverage the technological advantages of Farview Technology Groups zero-carbon industry to facilitate the green energy transformation and digital energy transformation of the Wuhe region. Looking to the future, the project will layout the green electricity industry, establish a regional carbon sink center, support the achievement of the dual carbon goals, and break the constraints of the dual control of energy consumption on local economic development.');
INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Rental Housing Planning and Architectural Design','Exploring Future Construction Models','2022','Shanghai','Urban planning','53803','Conceptual Project','Using the Luban lock as a prototype, explore future prefabricated construction models. Deconstruct the elements to obtain several similar constituent elements; take three stories as a unit to slice the architectural form, and combine the solid and void masses; randomly combine the disassembled Luban lock elements to create a dynamic and stable facade effect.');
INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Stadium Design','Large-span Roof System','2018','Dalian','Architecture','16800','Conceptual Project','In this architectural design scheme for the sports stadium, the main building deals with the large space by combining arches and cables. It uses columns to support a self-stabilizing steel ring frame, forming the first tension node of the cable, while the arch meets the requirement for large-span, column-free spaces, providing the second tension node for the cable. The roof load is borne by a flexible double-layer cable structure, which also forms the curved surface of the roof, meeting acoustic requirements. The spirit of sports is embodied in the perfect circles and arch curves of this building. The steel ring frame, combined with the arrangement of the stands, forms a unique upward curve, and the main part is sleek and unified, adhering to the principle of ultimate beauty, ultimate simplicity. The site design focuses on connectivity with the surroundings, dividing the site into smaller blocks, activating the space, and serving the people.');
INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Conch Group Talent Apartment Architectural Design','Urban Balcony','2022','Wuhu','Architecture','33000','Under Construction','This project presents a stretched streamline posture with the main entrance facing the road, while the upper apartment section is twisted to face south to receive sunlight exposure. At the same time, the upper apartments form an aerial balcony facing the mountains through different curves on each level, offering a panoramic view of the citys beautiful scenery.');

INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Jinan Commercial Renovation - MingHu International IT Industrial Park','Renovation','2021','Jinan','Architecture','107283','Completed','The design begins from an urban perspective, conducting an in-depth analysis of the renovation project. It starts with urban positioning and functional positioning for integration, aiming to enhance the value of old buildings, attract popularity, and integrate with urban spaces. The interior part aims to create an experiential social business park. By opening the ground floor public space to the city and combining landscape techniques, an urban forest is created to provide a space and venue for the surrounding community and citizens to get close to nature, engage in sports, leisure, life services, and host various events.');
INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Exhibition Board Design - China International Housing Industry Expo','Subtitle here','2021','Beijing','Graphic Design','0','Conceptual Project','ContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContent');
INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('CCCC Group Industrial Park Design Project','Subtitle here','2020','Linyi','Architecture','1000','Completed','ContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContent');
INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Signage Design - Taizhou Prefabricated Production Base','Subtitle here','2020','Taizhou','Graphic Design','0','Conceptual Project','ContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContent');
INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Exhibition Hall Design - Taizhou Prefabricated Production Base','Subtitle here','2020','Taizhou','Interior Design','576','Completed','ContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContent');
INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Brochure Graphic Design - Composite Exterior Wallboard','Subtitle here','2020','Shanghai','Graphic Design','0','Conceptual Project','ContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContent');

INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Sany Research and Development Centre Design Project','Subtitle here','2019','Shanghai','Architecture','1000','Completed','ContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContent');
INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Jiguang College Alumni Home Cabin','Subtitle here','2019','Shanghai','Interior Design','120','Conceptual Project','ContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContent');
INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Conch Group Office Building Design','Subtitle here','2022','Wuhu','Architecture','1000','Under Construction','ContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContent');
INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Logo Design - Alumi of DUT','Subtitle here','2019','Dalian','Graphic Design','0','Conceptual Project','ContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContent');
INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Dalian Old Port Area Renovation','Subtitle here','2019','Dalian','Architecture','1000','Conceptual Project','ContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContent');
INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('High-rise Office Building on Huanghe Road in Dalian','Subtitle here','2018','Dalian','Architecture','45000','Conceptual Project','This project features economically practical office spaces as the main standard office rooms, while also arranging a large number of open office spaces around a shared viewing balcony, combining the viewing balcony with open office spaces and multimedia rooms.');

INSERT INTO 'projects'('title', 'subtitle','year','location',`industry`,`area`,`status`,`content`) VALUES ('Lingshui Bay Urban Design','Based on the Topological Relationships of Squares in Dalian City.','2018','Dalian','Urban planning','1264000','Conceptual Project','ContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContent');


-- ******************************user database******************************

-- ******BE CAREFUL!!!!!!************BE CAREFUL!!!!!!******BE CAREFUL!!!!!!******BE CAREFUL!!!!!!
DROP TABLE IF EXISTS users;
-- ******BE CAREFUL!!!!!!************BE CAREFUL!!!!!!******BE CAREFUL!!!!!!******BE CAREFUL!!!!!!
CREATE TABLE IF NOT EXISTS `users` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `username` TEXT NOT NULL,
    `password` TEXT NOT NULL
);

-- ******************************comments database******************************

-- ******BE CAREFUL!!!!!!************BE CAREFUL!!!!!!******BE CAREFUL!!!!!!******BE CAREFUL!!!!!!
DROP TABLE IF EXISTS comments;
-- ******BE CAREFUL!!!!!!************BE CAREFUL!!!!!!******BE CAREFUL!!!!!!******BE CAREFUL!!!!!!
CREATE TABLE IF NOT EXISTS `comments` (
    `id` INTEGER PRIMARY KEY AUTOINCREMENT,
    `project_id` INTEGER NOT NULL,
    `user_id` INTEGER NOT NULL,
    `comment` TEXT NOT NULL,
    `rating` INTEGER NOT NULL,
    `time` TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);