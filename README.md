# internet_checker

This is the demo project for continuos internet checker.

## Getting Started
Dependency used for this project:
* connectivity: any
* rxdart: ^0.27.5


code: 
* page must user NetworkCheckerPage() inside column
```flutter
 Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const NetworkCheckerPage(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("on/off intenet to get result"),
                ],
              ),
            ),
          ],
        ),
      )
```
