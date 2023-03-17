using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace NationalGlass.Pages;

public class IndexModel : PageModel
{
    private readonly ILogger<IndexModel> _logger;
    public readonly string Greeting;
    public readonly string Subject;
    
    public IndexModel(ILogger<IndexModel> logger, IConfiguration configuration)
    {
        _logger = logger;
        Greeting = configuration.GetSection("NG_GREETING").Value ?? "Hello";
        Subject = configuration.GetSection("NG_SUBJECT").Value ?? "World";
    }

    public void OnGet()
    {

    }
}
