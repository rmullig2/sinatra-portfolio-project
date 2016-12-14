# sinatra-portfolio-project

# description
This project is designed mimic a Major League Baseball Hot Stove League. Each user
will predict the destination teams and signing terms for each of the top 50 major
league free agents. The administrator will enter in the actual signing data and the
scores and standings are automatically generated.

# objectives
1. Create user accounts and ensure that users cannot modify each other's information.
2. Seed the database with the major league teams, top fifty free agents, and Admin user.
3. Allow users to enter one prediction per player.
4. Allow users to modify their predictions.
5. Allow users to view the current standings.
6. Allow users to view the teams and the free agent signings per team.
7. The Admin user alone can enter in the free agent signings.
8. Scores are automatically calculated.
9. If a prediction is entered after a free agent signing, that will not count towards the score.
10. Once a signing is entered, users cannot make a prediction for that player.

# installation
1. Run bundle install to install needed gems
2. Run shotgun to start web server
3. Browse to the home page given by shotgun

# contributors

If anyone would like to expand on the functionality of the program please use one of the existing branches
or create a new one. The player information in the seed file will need to be updated each year. You
may use whichever web site you prefer for ranking information.

The web pages are not heavily formatted. You may style them to match your tastes.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Licensed under GNU Open Source https://www.gnu.org/licenses/gpl-3.0.en.html
