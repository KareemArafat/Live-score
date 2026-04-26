abstract class ApiConst {
  // base
  static const baseUrl = "https://webws.365scores.com/web";
  static const headers = {'Content-Type': 'application/json'};
  static const baseImageUrl =
      'https://imagecache.365scores.com/image/upload/f_png,w_68,h_68,c_limit,q_auto:eco,dpr_2,d_';

  // images
  static String leagueImage(int id) =>
      "$baseImageUrl Countries:Round:131.png/v12/Competitions/$id";
  static String teamImage(int id) =>
      "$baseImageUrl Competitors:default1.png/v6/Competitors/$id";
  static String playerTeamImage(int id) =>
      "$baseImageUrl Athletes:default.png,r_max,c_thumb,g_face,z_0.65/Athletes/$id";
  static String playerNationalImage(int id) =>
      "$baseImageUrl Athletes:$id.png,r_max,c_thumb,g_face,z_0.65/v41/Athletes/NationalTeam/$id";

  // leagues feature
  static String allLeaguesEndPoint() =>
      "$baseUrl/competitions/?competitions=7,552,17,11,72,113,35,25,57,73,649,104";
  static String leagueTableEndPoint(int leagueId, int? season) =>
      "$baseUrl/standings/?competitions=$leagueId&seasonNum=$season&withSeasonsFilter=true";
  static String leagueMatchesEndPoint(int leagueId) =>
      "$baseUrl/games/results/?competitions=$leagueId";
  static String leagueMoreMatchesEndPoint(String pageUrl) =>
      "https://webws.365scores.com$pageUrl";
  static String leagueStatsEndPoint(int leagueId) =>
      "$baseUrl/stats/?competitions=$leagueId";
  static String leagueNewsEndPoint(int leagueId) =>
      "$baseUrl/news/?competitions=$leagueId&isPreview=false";

  // teams feature
  static String teamSquadEndPoint(int teamId) =>
      "$baseUrl/squads/?competitors=$teamId";
  static String teamMatchesEndPoint(int teamId) =>
      "$baseUrl/games/fixtures/?competitors=$teamId";
  static String teamStandingEndPoint(int teamId, int? leagueId) =>
      "$baseUrl/standings/?competitions=$leagueId&competitor=$teamId";
  static String teamNewsEndPoint(int teamId) =>
      "$baseUrl/news/?competitors=$teamId&isPreview=false";

  // matches feature
  static String matchDetailsEndPoint(int matchId) =>
      "$baseUrl/game/?timezoneName=Africa/Cairo&userCountryId=131&gameId=$matchId";
  static String matchStatsEndPoint(int matchId) =>
      "$baseUrl/game/stats/?games=$matchId";
  static String matchLineupStatsEndPoint(int matchId) =>
      "$baseUrl/fixtures/players?fixture=$matchId";

  // matches day feature
  static String dayMatchesEndPoint(String? day) =>
      "$baseUrl/games/allscores/?appTypeId=5&timezoneName=Africa/Cairo&userCountryId=131&sports=1&startDate=$day&endDate=$day&onlyMajorGames=true&withTop=true";

  // search feature
  static String searchEndPoint(String keyword) =>
      "$baseUrl/search/?appTypeId=5&langId=1&timezoneName=Africa/Cairo&userCountryId=131&query=$keyword&filter=all&sports=1";
}
