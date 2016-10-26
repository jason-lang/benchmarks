// Environment code for project bufeval

import jason.asSyntax.ASSyntax;
import jason.asSyntax.NumberTermImpl;
import jason.asSyntax.Structure;
import jason.environment.Environment;

import java.util.Random;
import java.util.logging.Logger;

public class BigEnv extends Environment {

    private Logger logger = Logger.getLogger("bufeval."+BigEnv.class.getName());

    /** Called before the MAS execution with the args informed in .mas2j */
    @Override
    public void init(String[] args) {
        super.init(args);
    }

    String[] functors = {
            "a", "b", "c", "d", "e", "f", "g", "i", "j", "k", "l"
    };
    
    Random r = new Random();
    
    @Override
    public boolean executeAction(String agName, Structure action) {

        clearPercepts();
        
        // add 1000 perceptions
        //int c = 0;
        for (int i = 0; i < 10000; i++) {
            if (r.nextBoolean()) {
                addPercept(ASSyntax.createLiteral( functors[ i%10], new NumberTermImpl(i)));
                //c++;
            }
        }        
        //System.out.println("added "+c+" percepts");
        
        informAgsEnvironmentChanged();
        return true;
    }

    
    
    /** Called before the end of MAS execution */
    @Override
    public void stop() {
        super.stop();
    }
}
