using Microsoft.Extensions.Configuration;

namespace AddAdult
{
    public static class AppConfig
    {
        private static IConfiguration _iconfiguration;
        static AppConfig()
        {
            GetAppSettingsFile();
        }

        public static void GetAppSettingsFile()
        {

            var builder = new ConfigurationBuilder()
                                 .SetBasePath(Directory.GetCurrentDirectory())
                                 .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true);
            _iconfiguration = builder.Build();
        }

        public static string GetConnectionString()
        {
            return _iconfiguration.GetConnectionString("DefaultConnection");
        }
    }
}